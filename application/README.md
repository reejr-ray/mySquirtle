
# How to run / start the program

***Make sure your python version is 3+, not 2.7***

* Navigate to the `/application` directory where `flaskroute.py` is located
* Install the following:
	* `pip3 install flask`
	* `pip3 install mysql-connector-python`
* Now enter the python shell by using `python3` 
	* `>>> import flask` (We only came across a python 2.7 vs a 3.8 conflict, but should have no errors)
	* `>>> exit()` (Exit shell)
* Back in the `/application`, Flask needs to know which file to run
	* `export FLASK_APP=flaskroute.py`
	* For dev purposes, I advise to also enter `export FLASK_DEBUGGER=1`, which allows files to be saved and can restart the webpage to see changes, rather than restarting Flask
* With no errors, run `flask run` and go to this local url `http://127.0.0.1:5000/`.

