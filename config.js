const Joi = require('joi');
const path = require('path');
const dotenv = require('dotenv')
const configSchema = require('./configSchema');

class Config {
  static readEnv() {
    dotenv.config({ path: path.join(__dirname, '../../.env') });
  }
}

module.exports = { Config };
