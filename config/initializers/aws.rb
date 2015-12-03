require 'yaml'

# Load S3 credentials
S3_CONFIG_FILE = File.join(Rails.root, 'config', 's3_credentials.yml')
S3_CONFIG = YAML.load_file(S3_CONFIG_FILE)[Rails.env]
