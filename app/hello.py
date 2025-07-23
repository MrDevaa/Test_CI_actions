def say_hello():
    return "Hello, world!"

def test_say_hello_type():
    assert isinstance(say_hello(), str)

if __name__ == "__main__":
    print(say_hello())
