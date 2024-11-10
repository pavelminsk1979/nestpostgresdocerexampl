import { Injectable } from '@nestjs/common';
import { UserRepository } from './app.repository';

@Injectable()
export class AppService {
  constructor(protected userRepository: UserRepository) {}

  async getUsers() {
    return this.userRepository.getUsers();
  }

  async createUsers() {
    const newUser = { name: 'Polina' };

    const result = await this.userRepository.createUsers(newUser);

    return result;
  }
}
