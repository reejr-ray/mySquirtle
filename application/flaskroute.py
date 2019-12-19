from flask import Flask, render_template, url_for
import mysql.connector
app = Flask(__name__)

mydb = mysql.connector.connect(host="localhost", user="root", passwd="csc648database", database="pokedex")

mycursor = mydb.cursor()
x = "*"
mycursor.execute("SELECT name FROM pokemon")

result = mycursor.fetchall()
for i in result:
	print(i)


@app.route("/")
def main():
	return render_template('home.html', len=len(result), result=result)

@app.route("/About")
def about():
	return render_template('about.html')

@app.route("/Pokemon")
def pokemon():
	return render_template('pokemon.html', len=len(result), result=result)


if __name__ == '__main__':
	app.run(debug=True)