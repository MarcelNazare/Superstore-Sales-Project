import pandas as pd

file = "C:\\Users\\marcel\\Documents\\Data Analysis Projects\\Superstore Sales Project\\data\\raw\\Superstore.csv"
df = pd.read_csv(file, encoding='latin1')

def printer(output):
    print(f"[+] -> {output}\n\n")

def check_rows(dataframe):
    printer(f"Head :->\n{df.head(10)}")
    printer(f"Tail :->\n{df.tail(10)}")


def main():
    print("Hello from superstore-sales-dataset!")
    check_rows(dataframe=df)


if __name__ == "__main__":
    main()

