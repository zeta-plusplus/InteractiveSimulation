# -*- coding: utf-8 -*-
"""--------------------------------------------------------------------------------
description:
    
--------------------------------------------------------------------------------"""
'''----------------------------------------------------------------------
load modules
----------------------------------------------------------------------'''
import csv
import os
import time
import tkinter as tk
import tkinter.ttk as ttk
import pathlib



'''----------------------------------------------------------------------
main script (directory operation, define script-global objects)
----------------------------------------------------------------------'''
print('')
print('********** pyConsole02.py **********')
scriptFilePath= os.path.dirname(os.path.abspath(__file__))
print('script file path: '+ str(scriptFilePath))
print('')

os.chdir(scriptFilePath)
print('current directory: '+os.getcwd())
print('')

pathParent1= pathlib.Path('../')
absPathParent1= pathParent1.resolve()
print('pathParent1: '+str(absPathParent1))
print('')

dataFileDir= str(absPathParent1) + '\dataTemp'
print('dataFileDir: ' + str(dataFileDir))
print('')

fileName="dataOut00.csv"
fullPathDataFile= str(dataFileDir) + "\\" + fileName
print('fullPathDataFile: ' + str(fullPathDataFile))
print('exist data file: ' + str( os.path.exists(fullPathDataFile) ))
print('')


'''--------------------
setting about time handling
--------------------'''
''''''
timeBegin=time.time()
timeLim=10000
tInterval=20    #[ms]


'''--------------------
setting about gui
--------------------'''
''''''
rootframe= tk.Tk()  # main gui window

# table display gui
treeview=ttk.Treeview(rootframe)
treeview["show"]= "headings"
treeview["columns"]=(1,2)
treeview.heading(1, text="variable")
treeview.heading(2, text="value")
treeview.pack()



'''----------------------------------------------------------------------
define sub-routines
----------------------------------------------------------------------'''
''''''
def readcsv(fileFullPath):
    
    # open and read simulation data csv
    if(os.path.exists(fileFullPath)==True):
        with open(fileFullPath, mode='r') as dataFile:
            reader = csv.reader(dataFile)
            #print(str(reader))
            
            i=0
            nCol=0
            dataMatrix=[]
            for row in reader:
                #print(str(row))
                #print(str(len(row)))
                if(len(row)==2)and(row[0]!='')and(row[1]!=''):
                    dataMatrix.append(row)
                    i=i+1
                    nCol= len(row)
                #***** end if *****
            #***** end for *****
            
        #***** end with *****
        dataFile.close()
    else:
        print('error: data file does not exit')
    #***** end if *****
    
    nRow=i
    
    return dataMatrix, nRow, nCol
#***** end def *****


'''---------------------------------------------------------'''
''''''
def mainroutine():
    
    if(os.path.exists(fullPathDataFile)==True):
        # read data csv
        [dataMatrix, nRow, nCol]= readcsv(fileFullPath=fullPathDataFile)
        
        x = treeview.get_children()
        
        # delete table displayed on window
        for item in x:
            treeview.delete(item)
        #----- end for -----
        
        # re-display info of scv data
        timeRunning= time.time() - timeBegin
        treeview.insert("","end",values=("time (after python script began)", timeRunning))
        
        i=0
        for i in range(nRow):
            treeview.insert("","end",values=(dataMatrix[i][0],dataMatrix[i][1]))
        #***** end for *****
    else:
        print("failed to open file")
    #***** end if *****
    
    # command of recursive call, with specific time interval
    rootframe.after(tInterval, mainroutine)
#***** end def *****



'''----------------------------------------------------------------------
main script
----------------------------------------------------------------------'''
''''''
# read data csv
[dataMatrix, nRow, nCol]= readcsv(fileFullPath=fullPathDataFile)

# display info of scv data
timeRunning= time.time() - timeBegin
treeview.insert("","end",values=("time(in python script)", timeRunning))
i=0
for i in range(nRow):
    treeview.insert( "","end",values=(dataMatrix[i][0],dataMatrix[i][1]) )
#***** end for *****


# call routine of display & update, with specific time interval
rootframe.after(tInterval, mainroutine)

# continue display & update of csv data until window is closed
rootframe.mainloop()

print('********** End of pyConsole02.py **********')
print('')
