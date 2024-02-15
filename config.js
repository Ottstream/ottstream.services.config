const Joi = require('joi');
const path = require('path');
const dotenv = require('dotenv')
const configSchema = require('./configSchema');
const { Dir } = require('fs');

class Config {
  static readEnv(dir) {
    dotenv.config({ path: dir });
  }
}

module.exports = { Config };
