using com.spacefederation as federation from '../db/schema';

service SpacefarerService @(requires: 'authenticated-user') {

  @restrict: [
    { grant: ['CREATE','DELETE','READ','UPDATE'], to: 'admin' },
    { grant: ['READ','UPDATE'],   to: 'user' }
  ]
  entity Departments as projection on federation.Departments;


  @restrict: [
    { grant: ['CREATE','DELETE','READ','UPDATE'], to: 'admin' },
    { grant: ['READ','UPDATE'],   to: 'user' }
  ]
  entity Positions as projection on federation.Positions;


  @restrict: [
    { grant: ['CREATE','DELETE','READ','UPDATE'], to: 'admin' },
    { grant: ['READ','UPDATE'],   to: 'user', where: 'originPlanet = $user.originPlanet' }
  ]
  entity Spacefarers @(odata.draft.enabled: true) as projection on federation.Spacefarers;
}