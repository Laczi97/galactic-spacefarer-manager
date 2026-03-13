using com.spacefederation as federation from '../db/schema';

service SpacefarerService {

    entity Departments as projection on federation.Departments;
    
    entity Positions as projection on federation.Positions;

    entity Spacefarers as projection on federation.Spacefarers;
}