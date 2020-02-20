pipeline {
    agent {
        label 'master'
    }
    environment {
        registry = "homework-268814/webapp"
        registryCredential = 'Homework'
    }
    stages {
        stage("Checkout") {
            steps {
                git branch: 'master', url: 'https://github.com/dktodorov/testing.git'
            }
        }
        stage("Test") {
            steps {
                sh "/usr/local/bin/pytest tests/tests.py"
            }
        }
        stage("Build and Push") {
            steps {
                script {
                    app = docker.build(registry)
                    docker.withRegistry('https://eu.gcr.io', 'gcr:' + registryCredential) {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
                
            }
        }
        
    }
}