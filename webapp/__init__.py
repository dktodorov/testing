import time
from flask import Flask

def create_app():
    app = Flask(__name__,)

    @app.route('/')
    def index():
        return "Hello World"

    @app.route('/intense')
    def intense():
        time.sleep(60)
        return "Workload finished"

    return app


if __name__ == '__main__':
    create_app()