import tkinter as tk
from tkinter import *
from tkinter import messagebox

def get_plaintext():
    global cipher
    cipher.set(e1.get())
    return

def get_key():
    global plain
    plain.set(e3.get())
    return

def get_plntxt():
    global plain
    decrypt_window = Toplevel(ed_screen)
    decrypt_window.geometry("475x85")
    plain = StringVar()
    decrypt_window.title("Simon 32/64")
    Label(decrypt_window, text='Enter Key').grid(row=0,padx=50)
    Label(decrypt_window, text='Enter Plaintext').grid(row=1)
    Label(decrypt_window, text='Ciphertext').grid(row=2)
    global e3
    e3 = Entry(decrypt_window)
    e4 = Entry(decrypt_window)


    e3.grid(row=0, column=1)
    e4.grid(row=1, column=1, padx=30)


    submit_plaintext = Button(decrypt_window, text = "Submit", fg = "Black", command = get_key)

    submit_plaintext.place(x=360,y=7)

    e6 = Label(decrypt_window, textvariable=plain).grid(row=2,column=1,padx=29,sticky='w')
    
    e6 = Label(decrypt_window, textvariable=(str(plain) + '0')).grid(row=2,column=1,padx=29,sticky='w')
    return

def get_cphrtxt():
    global cipher
    encrypt_window = Toplevel(ed_screen)
    encrypt_window.geometry("475x85")
    cipher = StringVar()
    encrypt_window.title("Simon 32/64")
    Label(encrypt_window, text='Enter Key').grid(row=0,padx=50)
    Label(encrypt_window, text='Enter Plaintext').grid(row=1)
    Label(encrypt_window, text='Ciphertext').grid(row=2)
    global e1
    e1 = Entry(encrypt_window)
    e2 = Entry(encrypt_window)


    e1.grid(row=0, column=1)
    e2.grid(row=1, column=1, padx=30)


    submit_plaintext = Button(encrypt_window, text = "Submit", fg = "Black", command = get_plaintext)

    submit_plaintext.place(x=360,y=7)

    e3 = Label(encrypt_window, textvariable=cipher).grid(row=2,column=1,padx=29,sticky='w')
    
    e3 = Label(encrypt_window, textvariable=(str(cipher))).grid(row=2,column=1,padx=29,sticky='w')
    return

if __name__ == "__main__":
#at end change w into interface
    ed_screen = tk.Tk()
    ed_screen.title("choose")
    ed_screen.geometry("475x85")


    encrypt_button = Button(ed_screen, text = "Start Encryption", fg = "Black", command = get_cphrtxt)
    decrypt_button = Button(ed_screen, text = "Submit", fg = "Black", command = get_plntxt)
    encrypt_button.place(x=360,y=7)
    decrypt_button.place(x=100,y=7)

    ed_screen.mainloop()

