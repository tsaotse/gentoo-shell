
import sys
import os

def split_file_by_chars(input_filename, chars_per_file=1000):
    """
    将文本文件按指定字符数分割成多个小文件
    
    :param input_filename: 输入文件路径
    :param chars_per_file: 每个分割文件的字符数限制
    """
    if not os.path.exists(input_filename):
        print(f"错误: 文件 '{input_filename}' 不存在")
        return

    # 获取文件名和扩展名，用于生成输出文件名
    base_name, ext = os.path.splitext(input_filename)
    
    file_index = 0
    current_char_count = 0
    output_file = None
    
    try:
        # 使用 utf-8 编码打开文件，确保中文等多字节字符正确处理
        with open(input_filename, 'r', encoding='utf-8') as f:
            for line in f:
                # 将行转换为字符列表以便精确切片
                # 注意：list(line) 会保留换行符 \n，这通常符合“字数”统计习惯
                line_chars = list(line)
                i = 0
                while i < len(line_chars):
                    # 如果当前文件未打开或已达到字数限制，创建新文件
                    if output_file is None or current_char_count >= chars_per_file:
                        if output_file:
                            output_file.close()
                        new_filename = f"{base_name}_part_{file_index:03d}{ext}"
                        # 以 write 模式打开，确保覆盖或新建
                        output_file = open(new_filename, 'w', encoding='utf-8')
                        file_index += 1
                        current_char_count = 0
                    
                    # 计算当前文件还能容纳多少字符
                    space_left = chars_per_file - current_char_count
                    # 截取剩余部分中足够填入当前文件的部分
                    chunk = line_chars[i:i+space_left]
                    output_file.write(''.join(chunk))
                    
                    # 更新计数和指针
                    current_char_count += len(chunk)
                    i += len(chunk)
                    
        # 关闭最后一个文件
        if output_file:
            output_file.close()
        print(f"分割完成! 共生成 {file_index} 个文件.")
        
    except Exception as e:
        print(f"发生错误: {e}")
    finally:
        # 确保在异常情况下也能关闭文件句柄
        if output_file and not output_file.closed:
            output_file.close()

if __name__ == "__main__":
    # 默认值
    target_file = "input.txt"
    num_chars = 1000
    
    # 获取文件名 (第一个参数)
    if len(sys.argv) > 1:
        target_file = sys.argv[1]
        
    # 获取字数 (第二个参数)
    if len(sys.argv) > 2:
        try:
            num_chars = int(sys.argv[2])
            if num_chars <= 0:
                raise ValueError("字符数必须为正整数")
        except ValueError:
            print("警告: 第二个参数必须是正整数，已使用默认值 1000")
            num_chars = 1000
            
    print(f"正在处理文件: {target_file}")
    print(f"每文件字符数限制: {num_chars}")
    split_file_by_chars(target_file, num_chars)
