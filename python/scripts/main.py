import pandas as pd

file = "C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\raw\\Superstore.csv"
df = pd.read_csv(file, encoding='latin1')

def main():
    print("Hello from superstore-sales-dataset!")


if __name__ == "__main__":
    main()
