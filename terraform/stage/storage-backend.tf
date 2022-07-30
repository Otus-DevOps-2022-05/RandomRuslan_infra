terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "ruslan-bucket"
    region     = "ru-central1"
    key        = "terraform.tfstate"
    access_key = "YCAJESAaXxHyj6XX030FCiO_D"
    secret_key = "YCPltS2Ytroxyg3kGEzxC1Tts04SmmSL3QkCgMh5"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
