pipeline {
  agent any
  stages {
    stage('Update Script') {
      steps {
        git(url: 'https://github.com/Pytgor/script.git', branch: 'main')
      }
    }

    stage('List_cm') {
      steps {
        sh 'ls -la'
      }
    }

  }
}