import Foundation

struct TableCell {
    var value: String
}

class Table {
    var rows: Int
    var columns: Int
    var cells: [[TableCell]]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.cells = [[TableCell]](repeating: [TableCell](repeating: TableCell(value: ""), count: columns), count: rows)
    }

    func displayTable() {
        for row in cells {
            var rowString = "|"
            for cell in row {
                rowString += " \(cell.value) |"
            }
            print(rowString)
        }
    }

    func updateValue(row: Int, column: Int, value: String) {
        cells[row][column].value = value
    }
}

print("Enter the number of rows:")
guard let rowCount = Int(readLine() ?? "") else {
    print("Invalid input")
    exit(0)
}

print("Enter the number of columns:")
guard let columnCount = Int(readLine() ?? "") else {
    print("Invalid input")
    exit(0)
}

let table = Table(rows: rowCount, columns: columnCount)

for i in 0..<rowCount {
    for j in 0..<columnCount {
        print("Enter the value for cell (\(i), \(j)):")
        if let value = readLine() {
            table.updateValue(row: i, column: j, value: value)
        }
    }
}

print("Table:")
table.displayTable()
