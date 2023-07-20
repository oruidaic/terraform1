pipeline {
  agent any
  options {
    skipDefaultCheckout(true)
  }
  tools {
    terraform "terraform-1.0.10"
  }
  stages{
    stage("clean workspace") {
      steps {
        cleanWs()
      }
    }
    stage("checkout") {
      steps {
        checkout scm
      }
    }
    stage("terraform init") {
      steps {
        sh "terraform init -no-color"   
      }
    }
    stage("terraform plan") {
      steps {
        sh "terraform plan -no-color -out=plan.out"
        input message: "Apply Plan?", ok: "Apply"
      }
    }
    stage("terraform apply") {
      steps {
        sh "terraform apply plan.out -no-color"    
      }
    }
  }
}


