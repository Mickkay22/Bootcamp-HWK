'''
	Steps for PyBank 
	1. Import csv module
	2. Read in the file
	3. Create variables 
    4. Calculate the total number of months included in the dataset
	4. 
	5.
'''
'''
	Variables in PyBank
	
	
'''
import csv

num_month = 0
net_total = 0
g_increase_v = 0
g_decrease_v = 0
firstline = True
with open( 'budget_data.csv',newline='',encoding= 'utf-8') as csv_file:
    budget_dic = csv.reader(csv_file, delimiter = ",")
    for row in budget_dic:
        if firstline: 
            firstline = False
        else:
            num_month += 1
            net_total += int(row[1])
            if int(row[1]) > g_increase_v:
                g_increase_v = int(row[1])
                g_increase_d = row[0]
            if int(row[1]) < g_decrease_v:
                g_decrease_v = int(row[1])
                g_decrease_d = row[0]
            
    text = "Financial Analysis\n-----------------------------------------"
    text += "\nTotal Months: " + str(num_month) + "\nTotal: $" + str(net_total) +"\n"
    text += "Average Change: $" + str(round(net_total/num_month,2)) + "\nGreatest Increase in Profits: " 
    text += str(g_increase_d) + " ($" + str(g_increase_v) + ")\nGreatest Decrease in Profits: "
    text += str(g_decrease_d) + " ($" + str(g_decrease_v) +")"
    
print(text)
    

file = open("final.txt", "w")
file.write(text)
  