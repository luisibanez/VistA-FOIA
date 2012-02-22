#!/usr/bin/python
import string
import subprocess

sourceFOIADirectory  = '/home/ibanez/src/OSEHR/VistA-FOIA/Packages/'
sourceOtherDirectory = '/home/ibanez/src/OSEHR/CodeConvergence/vxVista/ExportedRoutines/vxVistaRoutines/'

listofFOIAroutinesfile  = open('Vista_FOIA_Routines_List.txt','r')
listofOtherroutinesfile = open('vxVistA_Routines_List.txt','r')

listofFOIAroutines  = listofFOIAroutinesfile.readlines()
listofOtherroutines = listofOtherroutinesfile.readlines()

dictionary = {'filename':'path'}

#
#  Load the FOIA routines in a dictionary
#
for line in listofFOIAroutines:
  pieces = line.split('/')
  routinename = pieces[3][0:-1]  # remove \n
  dictionary[routinename]=line[0:-1]


#
#  Take a look at the content of the dictionary
#
# for key in dictionary.iterkeys():
#   print key+"  "+dictionary[key]


#
#  Load the second set of routines and find
#  their destination paths in the dictionary.
#
for routinename in listofOtherroutines:
  routinename = routinename[0:-1]  # remote \n
  if routinename in dictionary:
    destinationpath = dictionary[routinename]
    print routinename+" goes to "+destinationpath
    sourcefile = sourceOtherDirectory+routinename
    destinationfile = sourceFOIADirectory+destinationpath
    subprocess.call(["ls",sourcefile,destinationfile])
  else:
    if routinename[0] == '_':
      routinename2 = routinename[1:]
      if routinename2 in dictionary:
        destinationpath = dictionary[routinename2]
        print routinename+" goes to "+destinationpath
        sourcefile = sourceOtherDirectory+routinename
        destinationfile = sourceFOIADirectory+destinationpath
        subprocess.call(["ls",sourcefile,destinationfile])
      else:
        print routinename+" is not in the dictionary"

#
# At this point all the routines that have found a matching
# name would have been copied to their destination.
#
