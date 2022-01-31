# ac1-exercicios
Exercícios dos guiões da cadeira de Arquitetura de Computadores 1

Todos os exercícios foram resolvidos em 2021/22.

## Table of Contents
1. [Exercises](#exercises)
2. [Open Mars in Specific Directory](#open-mars-in-specific-directory)
	- 2.1 [Create shortcut to Mars.sh](#create-shortcut-to-marssh)

## Exercises

### [aula1](/aula1)
- [EX1](/aula1/EX1) - [EX2](/aula1/EX2) - [EX3](/aula1/EX3)
- [AC1-P-Aula1.pdf](/aula1/AC1-P-Aula1.pdf)

### [aula2](/aula2)
- [EX1](/aula2/EX1) - [EX2](/aula2/EX2) - [EX3](/aula2/EX3)
- [AC1-P-Aula2.pdf](/aula2/AC1-P-Aula2.pdf)

### [aula3](/aula3)
- [EX1](/aula3/EX1) - [EX2](/aula3/EX2) - [EXTRA](/aula3/EXTRA)
- [AC1-P-Aula3.pdf](/aula3/AC1-P-Aula3.pdf)

### [aula4](/aula4)
- [EX1](/aula4/EX1) - [EX2](/aula4/EX2) - [EX3](/aula4/EX3) - [EXTRA](/aula4/EXTRA)
- [AC1-P-Aula4.pdf](/aula4/AC1-P-Aula4.pdf)

### [aula5](/aula5)
- [EX1](/aula5/EX1) - [EX2](/aula5/EX2) - [EX3](/aula5/EX3) - [EX4](/aula5/EX4) - [EXTRA](/aula5/EXTRA)
- [AC1-P-Aula5.pdf](/aula5/AC1-P-Aula5.pdf)

### [aula6](/aula6)
- [EX1](/aula6/EX1) - [EX2](/aula6/EX2) - [EX3](/aula6/EX3) - [EX4](/aula6/EX4) - [EXTRA](/aula6/EXTRA)
- [AC1-P-Aula6.pdf](/aula6/AC1-P-Aula6.pdf)

### [aula7](/aula7)
- [EX1](/aula7/EX1) - [EX2](/aula7/EX2) - [EX3](/aula7/EX3) - [EX4](/aula7/EX4)
- [AC1-P-Aula7.pdf](/aula7/AC1-P-Aula7.pdf)

### [aula8](/aula8)
- [EX1](/aula8/EX1) - [EX2](/aula8/EX2)
- [AC1-P-Aula8.pdf](/aula8/AC1-P-Aula8.pdf)

### [aula9](/aula9)
- [EX1](/aula9/EX1) - [EX2](/aula9/EX2) - [EX3](/aula9/EX3) - [EX4](/aula9/EX4) - [EXTRA](/aula9/EXTRA)
- [AC1-P-Aula9.pdf](/aula9/AC1-P-Aula9.pdf)

### [aula10](/aula10)
- [EX1](/aula10/EX1) - [EX2](/aula10/EX2) - [EX3](/aula10/EX3)
- [AC1-P-Aula10.pdf](/aula10/AC1-P-Aula10.pdf)

### [aula11](/aula11)
- [EX1](/aula11/EX1)
- [AC1-P-Aula11.pdf](/aula11/AC1-P-Aula11.pdf)

### [aula12](/aula12)
- [AC1-P-Aula12.pdf](/aula12/AC1-P-Aula12.pdf)

### [teste_tipo1](/teste_tipo-1)
- [EX1](/teste_tipo-1/EX1) - [EX2](/teste_tipo-1/EX2) - [EX3](/teste_tipo-1/EX3)

## Open Mars in Specific Directory
1. Put **Mars.jar** in the directory you want it to open files and save files into
2. Create a bash script with the name, for example, **Mars.sh** and put it anywhere you want.
3. Put the following code inside **Mars.sh**:
```bash
#!/bin/sh

# Absolute path to the directory of Mars.jar
cd /absolute/path/to/mars/jar/folder

# Run Mars jar inside the directory specified above
java -jar Mars.jar
```
4. Allow **Mars.sh** to execute:
```
Inside the folder of the script
$ chmod +x Mars.sh
```
5. Run **Mars.sh**, which will open Mars.jar
```
$ ./Mars.sh
```
This is enough to make Mars.jar run in any directory you want.

### Create shortcut to Mars.sh
1. Edit **.bashrc** (or other file that might do the same job) as root with any text editor.
2. Add the following alias to the bottom of that file:
```bash
# alias to run Mars.sh
alias mars='bash /absolute/path/to/Mars/sh/bash/file/Marsh.sh'
```

3. Open a new terminal and run the alias in any directory you want and it will open Mars.jar.
```
$ mars
```
Notes to point 2:
- You can give any alias name you want, doesn't have to be *'mars'*
- This is the path to the **Mars.sh** file, and not the path to **Mars.jar** file like it was in [Open Mars in Specific Directory](#open-mars-in-specific-directory)
