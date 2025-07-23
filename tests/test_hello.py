from app.hello import say_hello

def test_say_hello():
    assert say_hello() == "Hello, world!"

def test_say_hello_type():
    assert isinstance(say_hello(), str)
