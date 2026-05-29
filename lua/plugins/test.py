# 这是注释


import os
import sys

# TEST

# TODO: hello
a = 1

def test_func(num: int) -> bool:
    """文档字符串"""

    if num > 0:
        print(f"数字：{num}")  # f-string
        return True
    else:
        return False


class TestClass:
    attr = 10

    def __init__(self):
        self.value = 20
        os._exit(0)


test_func()

print(a)
