import { Injectable } from '@nestjs/common';
import { User } from './user.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';

@Injectable()
export class UserRepository {
  constructor(
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {}

  async createUsers(newUser: { name: string }) {
    const user = new User();
    user.name = newUser.name;

    const result = await this.userRepository.save(user);
    return result;
  }

  async getUsers() {
    const result = await this.userRepository.find();

    return result;
  }
}
