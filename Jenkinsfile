pipeline {
    agent { docker { image 'node:14-alpine' } }
    stages {
        stage('build') {
            steps {
                sh 'npm --version'
                sh '''
                    echo "Multiline steps work too"
                    whoami
                '''
            }
        }
        stage('deploy') {
            steps {
                sh 'pwd'
                sh './deploy_test.bash'
            }
        }
    }
    post {
        success {
            echo 'Everything worked as expected :)'
        }
        failure {
            echo 'Deploy could not finish.'
        }
    }
}
