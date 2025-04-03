
class ContaBancaria:
    def __init__(self):
        # atributo privado recebendo o valor zero em seu início
        self.__saldo = 0

    def depositar(self, valor):
        if valor > 0:
            self.__saldo += valor
            return True
        
        return False
    
    def ver_saldo(self):
        return self.__saldo
        
        
        