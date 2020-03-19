from tkinter import *
import tkinter as tk
from tkinter import messagebox
from datetime import datetime, date
import sqlite3 as sq

con = sq.connect("novel.db")
c = con.cursor()


#retrieve data from table for novel display option
def get_novels(): 
    res = c.execute("SELECT Title, AuthorName FROM Novel JOIN Author \
                    WHERE Novel.AuthorID = Author.AuthorID")
    data = c.fetchall() 
    return data

#retrieve data from table for add novel option
def get_authors(): 
    res = c.execute("SELECT AuthorID, AuthorName FROM Author")
    data = c.fetchall() 
    return data
	


#main menu
def render_menu():
    window = Tk()
    window.title("San's Novel Database")
    window.geometry("200x100")
    res = Button(window, text="1. Display Novels", command = display_novels)
    res.pack()

    rpt = Button(window, text="2. Add Novel", command = add_novel)
    rpt.pack()

    ext = Button(window, text="3. Exit", command = lambda:end_program(window))
    ext.pack()
    window.mainloop()



#option 3    
def end_program(w):
    con.close()
    w.destroy()
    



#option 1
def display_novels():
    novels = get_novels()
    tbl = "Novels: Title, Author"
    tbl += "\n" + "-" * 40 + "\n"
    for row in novels:
        for field in row:
            tbl += str(field)
            tbl += ", "
        tbl += "\n" * 2
    tbl += "-" * 40
    messagebox.showinfo("Display Novels", tbl)



#option 2
def add_novel():

    res_req_win = Tk()
    res_req_win.title("Add Novel")
    res_req_win.geometry("400x400")

    date_frame = Frame(res_req_win)
    date_frame.pack(side = LEFT)

    dd = tk.StringVar(res_req_win)
    mm = tk.StringVar(res_req_win)
    yyyy = tk.StringVar(res_req_win)
    bt = tk.StringVar(res_req_win)
    
    lbl = Label(date_frame, text = "Enter Publication Dates and Book Title: ").pack()
    
    lbldd = Label(date_frame, text = "Day").pack()
    day = Entry(date_frame, text="DD", textvariable = dd).pack()

    lblmm = Label(date_frame, text = "Month").pack()
    month = Entry(date_frame, text="MM", textvariable = mm).pack()

    lblyyyy = Label(date_frame, text = "Year").pack()
    year = Entry(date_frame, text="YYYY", textvariable = yyyy).pack()

    lblnovelname = Label(date_frame, text = "Title").pack()
    title = Entry(date_frame, text="BT", textvariable = bt).pack()

    option_frame = Frame(res_req_win)
    option_frame.pack(side = RIGHT)

    authors = get_authors()
    authorlb = author_lb(res_req_win, option_frame, authors)

    c.execute("SELECT COUNT(BookID) FROM Novel")
    book_id = c.fetchone()[0] + 1

    rpt = Button(date_frame, text="Enter Novel",\
                 command = lambda: check_selection(dd.get(), mm.get(), yyyy.get(),\
                bt.get(), book_id, authors[authorlb.curselection()[0]][0])).pack()
    
    res_req_win.mainloop()


#allows users to choose between existing authors
def author_lb(w,f, authors):
    lblauthor = Label(f,text = "Choose Author").pack(side = TOP)

    Lb = Listbox(f, height = 8, width = 26,font=("arial", 12), exportselection = False) 
    Lb.pack(side = BOTTOM, fill = Y)
                
    scroll = Scrollbar(w, orient = VERTICAL)
    scroll.config(command = Lb.yview)
    scroll.pack(side = RIGHT, fill = Y)
    Lb.config(yscrollcommand = scroll.set)

    i = 0
    for author in authors:
        Lb.insert(i, author)
        i += 1
    Lb.selection_set(first = 0)

    return Lb


#this handles possible errors involving invalid dates
def check_selection(d, m, y, t, b, a):
    try:
        dt = date(int(y), int(m) , int(d))
        add_to_database(dt, t, a, b)
        messagebox.showinfo("Success", "Your novel has been added")
    except:
        messagebox.showinfo("Error", "Error - Please Try Again")
        return


#final step to adding novel to database
def add_to_database(date, title, author, book_id):
    ins_str = 'INSERT INTO Novel (Title, BookID, NovelPD, AuthorID) \
    Values ("' + str(title) + '", ' + str(book_id) + ', \
    "' + str(date) + '", ' + str(author) + ');'
    res = c.execute(ins_str)
    con.commit()	


render_menu()


