'''
	Steps for PyPoll 
	1. Import csv module
	2. Read in the file
	3. Create variables 
    4. Calculate the total number votes cast
	5. A complete list of candidates who recieved votes
	6. Percentage of votes each candidate won 
    7. total number of votes each candidate won
    8. The winner of the election based on popular vote
'''
'''
	Variables in PyBank
    votes:
    firstline:
	total_votes:
    candidates:
    candidate_votes:
    winner:
	text:
'''
import csv

total_votes = 0 
candidates = []
candidate_votes = []
winner = ""
text = "" 
firstline = True

with open( 'election_data.csv',newline='',encoding= 'utf-8') as csv_file:
    votes = csv.reader(csv_file, delimiter = ",")
    
    for row in votes:
        if firstline:
            firstline = False
        else: 
            total_votes += 1
            if str(row[2]) not in candidates:
                candidates.append(str(row[2]))
                candidate_votes.append(1)
            else: 
                vote = candidates.index(str(row[2]))
                candidate_votes[vote] += 1
winner = candidates[candidate_votes.index(max(candidate_votes))]
text = "Election Results\n------------------------------------------\n"
text += "Total Votes: " + str(total_votes) + "\n------------------------------------------\n"
for i in range(len(candidates)):
    text += str(candidates[i]) + ": "  + str(round(100*candidate_votes[i]/total_votes,3)) 
    text += "% (" + str(candidate_votes[i]) +")\n"

text += "------------------------------------------\n"
text += "Winner: " + winner
text += "\n------------------------------------------"

print(text)
file = open("the_votes_are_in.txt","w")
file.write(text)            