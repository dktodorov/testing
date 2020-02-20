pipeline {
    agent {
        label 'master'
    }
    environment {
        registry = "homework-268814/webapp"
        registryCredential = 'Homework'
    }
    stages {
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