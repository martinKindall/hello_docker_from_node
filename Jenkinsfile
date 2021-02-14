pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh '''
                    echo "Multiline steps work too"
                '''
            }
        }
        stage('deploy') {
            steps {
                sh '''
                    pwd
                    ls -a
                '''
                sh 'sh ./deploy_test.sh'
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
