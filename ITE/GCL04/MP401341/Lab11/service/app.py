from flask import Flask, request, render_template, redirect, send_file
import argparse
import tempfile
from subprocess import Popen
import io

parser = argparse.ArgumentParser()
parser.add_argument('lz4_path',  type=str,help='Path for lz4')
parser.add_argument('version',  type=str,help='version')
args = parser.parse_args()

app = Flask(__name__)
app.secret_key = "secret key"

@app.route('/')
def upload_form():
    return render_template('upload.html',info={"version":args.version})

def no_file():
    return redirect("/")

def lz4_compress(input_file,output_file):
    process = Popen([args.lz4_path,"-f",input_file.name, output_file.name])
    stdout, stderr = process.communicate()

def lz4_decompress(input_file,output_file):
    process = Popen([args.lz4_path,"-f","-d",input_file.name, output_file.name])
    stdout, stderr = process.communicate()

def whole_file_process(lz4_operation, output_name):
    if request.method == 'POST':
        print(request.files)
        if 'file' not in request.files:
            return no_file()
        file = request.files['file']        
        if file and file.filename != "":
            print(file)
            with tempfile.NamedTemporaryFile() as output_file:
                with tempfile.NamedTemporaryFile() as input_file:
                    input_file.write(file.read())
                    input_file.flush()
                    output_file.flush()
                    lz4_operation(input_file, output_file)
                    mem = io.BytesIO(output_file.read())
                    return send_file(mem, download_name=output_name, mimetype="text/plain", as_attachment=True)
        else:
            return no_file()

@app.route('/lz4-compress', methods=['POST'])
def upload_compress():
    return whole_file_process(lz4_compress,"lz4.bin")

@app.route('/lz4-decompress', methods=['POST'])
def upload_decompress():
    return whole_file_process(lz4_decompress,"lz4.txt")


if __name__ == "__main__":
    app.run()
