from tkinter import *
from tkinter import ttk
from tkinter import messagebox

# Configuracion de ventana

ventana = Tk()
ventana.title("Reports SITP")
marco = LabelFrame(ventana, text="Informe")
marco.grid(row=0, column=0, pady=12, padx=9)

# ("Horizontal , Vertical")

ventana.geometry("388x506")

ventana.resizable(0, 0)

# Definir variables

Numero_Cedu = IntVar(value=1)
nombre1 = StringVar(value='')
nombre2 = StringVar()
apellido1 = StringVar(value='')
apellido2 = StringVar(value='')
numerocelu = StringVar()
correoele = StringVar(value='')
fechain = StringVar(value='')
numerobus = StringVar(value='')
placabus = StringVar()
ti_daños = StringVar(ventana)
rol = StringVar(ventana)

# Funciones


def Archivo():
    archivo = open(f"Informe del dia {fechain.get()}", "w")
    archivo.write(f"--- Informe --- {fechain.get()} ---\n")
    archivo.write("------------------------------\n")
    archivo.write(f"Numero de cedula: {Numero_Cedu.get()}\n")
    archivo.write(f"Nombres: {nombre1.get()} {nombre2.get()}\n")
    archivo.write(f"Apellidos: {apellido1.get()} {apellido2.get()}\n")
    archivo.write(f"Numero celular: {numerocelu.get()}\n")
    archivo.write(f"Correo electronico: {correoele.get()}\n")
    archivo.write(f"Numero de bus: {numerobus.get()}\n")
    archivo.write(f"Placa del bus: {placabus.get()}\n")
    archivo.write("Rol Seleccionado: {}\n".format(rol.get()))
    archivo.write("Daño informado: {}\n".format(ti_daños.get()))
    archivo.close()


def Impresion():
    print(f"--- Informe --- {fechain.get()} ---")
    print("------------------------------")
    print(f"Numero de cedula: {Numero_Cedu.get()}")
    print(f"Nombres: {nombre1.get()} {nombre2.get()}")
    print(f"Apellidos: {apellido1.get()} {apellido2.get()}")
    print(f"Numero celular: {numerocelu.get()}")
    print(f"Correo electronico: {correoele.get()}")
    print(f"Numero de bus: {numerobus.get()}")
    print(f"Placa del bus: {placabus.get()}")
    print("Rol Seleccionado: {}".format(rol.get()))
    print("Daño informado: {}".format(ti_daños.get()))

    Archivo()


def Validacion():
    if Numero_Cedu.get() == 1:
        messagebox.showinfo("Error de informacion",
                            "Por favor digite su numero de cedula")

    elif nombre1.get() == "":
        messagebox.showinfo("Error de informacion",
                            "Por favor digite su nombre")

    elif apellido1.get() == "":
        messagebox.showinfo("Error de informacion",
                            "Por favor digite su primer apellido")

    elif apellido2.get() == "":
        messagebox.showinfo("Error de informacion",
                            "Por favor digite su segundo apellido")

    elif correoele.get() == "":
        messagebox.showinfo("Error de informacion",
                            "Por favor digite su correo electronico")

    elif fechain.get() == "":
        messagebox.showinfo("Error de informacion",
                            "Por favor digite la fecha actual")

    elif numerobus.get() == "":
        messagebox.showinfo("Error de informacion",
                            "Por favor digite el numero de bus")

    else:
        Archivo()

# Info de numero de cedula


ttk.Label(marco, text="Numero de cedula:").grid(
    row=1, column=0, padx=4, pady=4)
Num_Cedula = Entry(marco, textvariable=Numero_Cedu).grid(
    row=1, column=1, pady=4)

# Info de nombres

ttk.Label(marco, text="Primer Nombre:").grid(row=2, column=0, padx=4, pady=4)
Nomb_1 = Entry(marco, textvariable=nombre1).grid(row=2, column=1, pady=4)

ttk.Label(marco, text="Segundo Nombre:").grid(row=3, column=0, padx=4, pady=4)
Nomb_2 = Entry(marco, textvariable=nombre2).grid(row=3, column=1, pady=4)

# Info de apellidos

ttk.Label(marco, text="Primer Apellido:").grid(row=4, column=0, padx=4, pady=4)
Apell_1 = Entry(marco, textvariable=apellido1).grid(row=4, column=1, pady=4)

ttk.Label(marco, text="Segundo Apellido:").grid(
    row=5, column=0, padx=4, pady=4)
Apell_2 = Entry(marco, textvariable=apellido2).grid(row=5, column=1, pady=5)

# Info de comunicacion de usuarios

ttk.Label(marco, text="Numero de celular:").grid(
    row=6, column=0, padx=4, pady=4)
Numero_Celu = Entry(marco, textvariable=numerocelu).grid(
    row=6, column=1, pady=5)

ttk.Label(marco, text="Correo Electronico:").grid(
    row=7, column=0, padx=4, pady=4)
Correo = Entry(marco, textvariable=correoele).grid(row=7, column=1, pady=4)

ttk.Label(marco, text="Fecha del informe:").grid(
    row=8, column=0, padx=4, pady=4)
Fecha = Entry(marco, textvariable=fechain).grid(row=8, column=1, pady=4)

ttk.Label(marco, text="(DD-MM-AAAA)").grid(row=8, column=2, padx=4, pady=4)

# Info de rol

lista_rol = ["Persona Natural",
             "Operador"]

rol.set("Seleccione su rol")
menu_rol = OptionMenu(marco, rol, *lista_rol).grid(row=9,
                                                   column=1, padx=4, pady=4)

# Info de buses

ttk.Label(marco, text="Numero del bus:").grid(row=10, column=0, padx=4, pady=4)
Nume_Bus = Entry(marco, textvariable=numerobus).grid(row=10, column=1, pady=4)

ttk.Label(marco, text="Placa del bus:").grid(row=11, column=0, padx=4, pady=4)
Placa = Entry(marco, textvariable=placabus).grid(row=11, column=1, pady=4)

# Info de daños

lista_daños = ["Sillas en mal estado",
               "Puertas mal cierre",
               "Fallas en el timbre",
               "Fallas torniquete",
               "Tubos en mal estado",
               "Manija de la ventana",
               "Caja de cambios y diferenciales",
               "Catalizador",
               "Circuito de refrigeracion",
               "Correa reventada",
               "Fallas de inyectores",
               "Filtro obstruido",
               "Fugas de aceite",
               "Llantas",
               "Motor",
               "Valvulas fallando"]

ti_daños.set("Seleccione el daño")
menu_lista = OptionMenu(marco, ti_daños, *
                        lista_daños).grid(row=12, column=1, pady=4)

# Boton

Boton = Button(marco, text="Enviar datos", command=Validacion)
Boton.grid(row=13, column=1, sticky=W+E)

# Diseño de la aplicacion

ventana.iconbitmap('icono.ico')

ventana.config(bg="yellow")

marco.config(bg="blue")

Boton.config(fg="yellow", bg="gray")

image = PhotoImage(file="imagen.png")

Im = Label(marco, image=image).grid(row=0, column=1)

ventana.mainloop()
