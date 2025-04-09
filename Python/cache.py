class Cache():
    def __init__(self):
        self.cache = {}
    def __call__(self, func):
        def wrapper(*args):
            if args in self.cache:
                return self.cache[args]
            result = func(*args)
            self.cache[args] = result
            return result
        return wrapper
            
        
