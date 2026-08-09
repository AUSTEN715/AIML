class Laptop:
    storage_type = "ssd"

    def __init__(self, RAM, storage):
        self.RAM = RAM
        self.storage = storage

    @staticmethod
    def calc_discount(price, discount):  # static method => cannot access any attribute
        final_price = price - (discount * price/100)
        print(f"final price = {final_price}")

    @classmethod # decorator => makes the function act as a class method
    def get_storage_type(cls):  # class method => can only acces the class att
        print(f"storage type = {cls.storage_type}")


    def get_info(self): # instance method => acces the class att as-well as the instance att
        print(f"laptop has {self.RAM} RAM and {self.storage} storage")


l1 = Laptop("16gb", "512gb")
l1.get_info()
l1.get_storage_type()
l1.calc_discount(100, 10)
