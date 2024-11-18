import serial
import binascii
import tkinter as tk
from tkinter import *
from tkinter import messagebox

def get_cphrtxt():
    global cphrtxt
    cphrtxt.set(encrypt(e1.get(),e2.get()))
    return 

def encrypt(key,plntxt):
    # Open serial connection to Basys3
    ser = serial.Serial(port='COM4', baudrate=9600, parity=serial.PARITY_NONE, timeout=1)

    # Receive key and convert into bytes
    padded_key = key.zfill(8)
    if len(padded_key) != 8:
        messagebox.showerror("Error", "Key cannot be more than 8 characters. Please input a new key.")
        return ''
    encoded_padded_key = padded_key.encode('utf-8')

    # Receive plaintext, divide it into byte sized strings, convert into bytes
    plntxt_list = []
    for i in range(0,len(plntxt),4):
        plntxt_list.append(plntxt[i:i+4])

    if plntxt_list == []:
        messagebox.showinfo("Information", "Please enter Plaintext to encrypt.")
        return ''
    plntxt_list[-1] = plntxt_list[-1].zfill(4)
    encoded_bytes_list = []
    for single_plntxt in plntxt_list:
        encoded_bytes_list.append(single_plntxt.encode('utf-8'))


    # Input all parts of the plaintext with the same key
    i = 0
    for i in range(len(encoded_bytes_list)):
        ser.write(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00")
        ser.write(encoded_padded_key)
        ser.write(encoded_bytes_list[i])

    # Capture final cphrtxt by appending the individual cphrtxts that have been received
    final_cphrtxt = b""
    i=0
    while i<len(plntxt_list)*2:
        unencoded_cphrtxt = ser.read(4)
        if i%2:
            final_cphrtxt += unencoded_cphrtxt
        i+=1

    # Convert cphrtxt to utf-8 characters
    final_cphrtxt = binascii.b2a_hex(final_cphrtxt)
    final_cphrtxt = final_cphrtxt.decode('utf-8')
    return final_cphrtxt
    

if __name__ == "__main__":
#at end change w into interface

    w = tk.Tk()
    cphrtxt = StringVar()
    key = StringVar()
    plntxt = StringVar()
    w.geometry("475x85")
    
    w.title("Simon 32/64")
    Label(w, text='Enter Key').grid(row=0,padx=50)
    Label(w, text='Enter Plaintext').grid(row=1)
    Label(w, text='Ciphertext').grid(row=2)
    e1 = Entry(w)
    e2 = Entry(w)
    e1.grid(row=0, column=1)
    e2.grid(row=1, column=1, padx=30)
    encrypt_button = Button(w, text = "Start Encryption", fg = "Black", command = get_cphrtxt)
    encrypt_button.place(x=360,y=7)
    e3 = Label(w, textvariable=cphrtxt).grid(row=2,column=1,padx=29,sticky='w')
 
    w.mainloop()
    
    