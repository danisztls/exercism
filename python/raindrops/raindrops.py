def convert(number):
    musical = False
    string = ''
    if number % 3 == 0:
        string += 'Pling'
        musical = True
    if number % 5 == 0:
        string += 'Plang'
        musical = True
    if number % 7 == 0:
        string += 'Plong'
        musical = True
    return string if musical else str(number)
