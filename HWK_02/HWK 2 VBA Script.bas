Attribute VB_Name = "Module1"
Sub HWK2_Final():
' Steps:
'   1. Create all variables
'   2. Create a FOR LOOP to go through all worksheets
'   3. Find the number of rows with data
'   4. Label the right columns for data to be inputed
'   5. initialize ticker,year_open and volume for the worksheet
'   6. Create a FOR LOOP to go through all rows in worksheet
'   7. If the ticker changes then we find the year close to the ticker before it changed
'   8. Defining all variables: yearly change, percent change, and total volume
'   9. Checking to see if the percent change increase or decrease is the greatest (same with total volume)
'       (Saving ticker and value if the it is the greatest %increase %decrease or total volume)
'   10. If the yearly change is negative then fill = red; positive then fill = green
'   11. Reset variables for next ticker in worksheet
'   12. If the ticker is the same and not different instead of stpes 7-11 we will add the volume
'        in the row to the volume variable
'   13. After the code goes through the worksheet we will return to the first sheet and display the information
'        for the largest % increase, % decrease and greatest total volume
'   14. Repeat for all worksheets in workbook and then go back to the first worksheet
'Step 1 VARIABLES--------------------------------------------------------------------------------------------------------
    Dim ws As Worksheet
    Dim starting_ws As Worksheet
    Set starting_ws = ActiveSheet
    
    Dim lastRow As Long
    Dim ticker_row As Integer
    ticker_row = 2

    Dim ticker As String
    


    Dim greatest_pi_v As Double
    Dim greatest_pd_v As Double
    
    greatest_pi_v = 0
    greatest_pd_v = 0
    greatest_tv_v = 0

    Dim greatest_pi_t As String
    Dim greatest_pd_t As String
    Dim greatest_tv_t As String


    
' Step 2-------------------------------------------------------------------
    For Each ws In ThisWorkbook.Worksheets
        ws.Activate
' Step 3-------------------------------------------------------------------
        lastRow = Cells(Rows.Count, 2).End(xlUp).Row
' Step 4-------------------------------------------------------------------
        Range("I1") = "Ticker"
        Range("J1") = "Yearly Change"
        Range("K1") = "Percent Change"
        Range("L1") = "Total Stock Volume"
' Step 5-------------------------------------------------------------------
        ticker = Range("A2")
        year_open = Range("C2")
        volume = Range("G2")
' Step 6-------------------------------------------------------------------
        For i = 2 To lastRow
            If Cells(i, 1).Value <> ticker Then
' Step 7-------------------------------------------------------------------
                year_close = Cells(i - 1, 6).Value
' Step 8-------------------------------------------------------------------
                Cells(ticker_row, 9).Value = ticker
                Cells(ticker_row, 10).Value = year_close - year_open
                If Cells(ticker_row, 10).Value = 0 Then
                    Cells(ticker_row, 11) = 0
                Else
' No division by 0---------------------------------------------------------
                    If year_open = 0 Then
                        Cells(ticker_row, 11).Value = year_close
                    Else
                        Cells(ticker_row, 11).Value = (year_close - year_open) / year_open
' Step 9-------------------------------------------------------------------
                        If Cells(ticker_row, 11).Value > greatest_pi_v Then
                            greatest_pi_t = Cells(ticker_row, 9).Value
                            greatest_pi_v = Cells(ticker_row, 11).Value
                        End If
                
                        If Cells(ticker_row, 11).Value < greatest_pd_v Then
                            greatest_pd_t = Cells(ticker_row, 9).Value
                            greatest_pd_v = Cells(ticker_row, 11).Value
                        End If
                
                        If volume > greatest_tv_v Then
                            greatest_tv_t = Cells(ticker_row, 9).Value
                            greatest_tv_v = Cells(ticker_row, 12).Value
                        End If

                    End If
                    
                End If
                Cells(ticker_row, 12) = volume
' Step 10-------------------------------------------------------------------
                If Cells(ticker_row, 10).Value > 0 Then
                    Cells(ticker_row, 10).Interior.ColorIndex = 4
                Else
                    Cells(ticker_row, 10).Interior.ColorIndex = 3
                End If

                
' Step 11------------------------------------------------------------------
                ticker_row = ticker_row + 1
                ticker = Cells(i, 1).Value
                year_open = Cells(i, 3).Value
                volume = Cells(i, 7).Value
            Else
' Step 12------------------------------------------------------------------
                volume = Cells(i, 7).Value + volume
            End If
                
        Next i
' Step 13------------------------------------------------------------------
        Range("O1") = "Ticker"
        Range("P1") = "Value"
        
        Range("N2") = "Greatest % Increase"
        Range("O2") = greatest_pi_t
        Range("P2") = greatest_pi_v
        
        Range("N3") = "Greatest % Decrease"
        Range("O3") = greatest_pd_t
        Range("P3") = greatest_pd_v
        
        Range("N4") = "Greatest Total Volume"
        Range("O4") = greatest_tv_t
        Range("P4") = greatest_tv_v
        
        greatest_pi_v = 0
        greatest_pd_v = 0
        greatest_tv_v = 0
        
' Step 14-----------------------------------------------
        ws.Range("I:P").EntireColumn.AutoFit
        Range("K:K").NumberFormat = "0.00%"
        Range("P2:P3").NumberFormat = "0.00%"
        ticker_row = 2

    Next
' Step 15------------------------------------------------------------------
    starting_ws.Activate
End Sub
