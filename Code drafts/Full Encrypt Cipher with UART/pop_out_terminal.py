import tkinter as tk
from tkinter import *
from tkinter import messagebox
def get_key():
    key = e1.get()
    return key

def get_plaintext():
    global ciphertext
    # plaintext = e2.get()
    if e2.get() == '5':
        messagebox.showerror("showerror", "Error")
    ciphertext.set(e2.get()) 
    return #plaintext

def get_ciphertext():
    return
if __name__ == "__main__":
#at end change w into interface
    w = tk.Tk()
    w.geometry("475x85")
    ciphertext = StringVar()
    w.title("Simon 32/64")
    Label(w, text='Enter Key').grid(row=0,padx=50)
    Label(w, text='Enter Plaintext').grid(row=1)
    Label(w, text='Ciphertext').grid(row=2)
    e1 = Entry(w)
    e2 = Entry(w)


    e1.grid(row=0, column=1)
    e2.grid(row=1, column=1, padx=30)


    submit_key = Button(w, text = "Submit", fg = "Black", command = get_key)
    submit_plaintext = Button(w, text = "Submit", fg = "Black", command = get_plaintext)

    submit_plaintext.place(x=360,y=7)

    e3 = Label(w, textvariable=ciphertext).grid(row=2,column=1,padx=29,sticky='w')
    
    
    w.mainloop()

