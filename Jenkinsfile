pipeline {
  agent any
  options { timestamps() }
  stages {
    stage('Checkout') { steps { checkout scm } }
    stage('Run script') {
      steps { sh 'bash script.sh | tee output.txt' }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'output.txt', onlyIfSuccessful: false
      emailext(
        subject: "Task-2: ${env.JOB_NAME} #${env.BUILD_NUMBER} — ${currentBuild.currentResult}",
        to: "MENTOR_EMAIL_HERE",
        body: "Build: ${env.BUILD_URL}\nResult: ${currentBuild.currentResult}\n(Attached: output.txt)",
        attachmentsPattern: "output.txt",
        recipientProviders: [
          [$class: 'DevelopersRecipientProvider'],
          [$class: 'RequesterRecipientProvider']
        ]
      )
    }
  }
}
