
# it is my input, n numbers and used int for casting since input() returns a string
n = int(input())

# create a list of numbers from 1 to n, in python lists act as array in this case
numbers = list(range(1, n + 1))

# this will tell us which rule we are currently on, in our case 0 = even positions; 1= odd positions ; and 2= every third
rule_number = 0


while len(numbers) > 1:
    # it collects the numbers that survived this round
    survived_numbers = []
    
    for i in range(len(numbers)):
        # in our game ppsitions start from 1, so we need to add 1 to the index
        position = i + 1  # since we want to start counting from 1, not 0
        
        # our first rule: even positions go, odd ones stay
        if rule_number == 0 and position % 2 == 1:
            survived_numbers.append(numbers[i])
            
        # our second rule: odd positions go, even ones stay
        elif rule_number == 1 and position % 2 == 0:
            survived_numbers.append(numbers[i])
        # ouyr third rule: every third position goes, the rest stay
        elif rule_number == 2 and position % 3 != 0:
            survived_numbers.append(numbers[i])
    # after we have gone through all the numbers, we need to update our list of numbers to be the ones that survived this round
    numbers = survived_numbers 
    
    # we need to update our rule number for the next round, we use modulo 3 since we have 3 rules
    rule_number = (rule_number + 1) % 3
    
print(numbers[0])  # print the last remaining number