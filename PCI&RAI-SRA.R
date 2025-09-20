#https://youtu.be/HQTxuZ0Mrfc
library(precintcon)


#Calculate PCI 
view(pci_rai_values) # pci_rai_values an object which stores value

pci(as.daily(pci_rai_values,na.value = NA))


#Calculate RAI
view(pci_rai_values) # pci_rai_values an object which stores value

rai(as.daily(pci_rai_values,na.value = NA))

rai(as.daily(pci_rai_values,na.value = NA),granularity = "a")
