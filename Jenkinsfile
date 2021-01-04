pipeline {
    agent any
    parameters {
        gitParameter(description: "Which feature branch shall be deployed?", name: "GIT_SOURCE_BRANCH", type: "PT_BRANCH")
        choice(name: "PROJECT_NAME", choices: ['bam', 'admin'])
    }

    stages {
        stage("Checkout Feature Branch") {
            steps {
                script {
                    sh("git checkout $GIT_SOURCE_BRANCH")
                }
            }
        }

        stage("Build & Prepare Deployment") {
            steps {
                script {
                    sh "./mvnw clean install -DskipTests"
                    python3 """
                        pip install --user -r ./config/ansible/requirements.txt
                        rm -rf config/ansible/roles
                        ansible-galaxy install -r ./roles/requirements.yml -f
                    """
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    sh "chmod 0777 ./config/ansible/deploy-${PROJECT_NAME}.yaml"
                    python3 """
                        ./config/ansible/deploy-${PROJECT_NAME}.yaml --extra-vars env=dev-ci
                    """ 
                }
            }
        }
    }
}

def python3(cmd) {
    sh """
        source ~/.bashrc > python3-setup.log 2>&1
        source activate prod3 >> python3-setup.log 2>&1
        ${cmd}
    """
}