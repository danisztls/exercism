class Matrix:
    def __init__(self, matrix_string):
        # a matrix is a list of rows
        #row_n = len(matrix_string).count('\n') # number of rows
        #col_n = (len(matrix_string).count(' ') + row_n)/row_n # number of columns
        self.matrix = []

        for i in matrix_string.split('\n'):
            vector = []
            for j in i.split(' '):
                vector.append(int(j))
            self.matrix.append(vector)

    def row(self, index):
        return self.matrix[index - 1]

    def column(self, index):
        vector=[]
        for i in self.matrix:
            vector.append(i[index - 1])
        return vector
