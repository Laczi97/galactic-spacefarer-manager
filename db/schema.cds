namespace com.spacefederation;

using {cuid, managed} from '@sap/cds/common';

entity Departments {
  key ID          : Integer;
      name        : String;
      description : String;
      positions   : Association to many Positions
                      on positions.department = $self;
}

entity Positions {
  key ID         : Integer;
      title      : String;
      level      : Integer;
      department : Association to Departments;
      holders    : Association to many Spacefarers
                     on holders.position = $self;
}

entity Spacefarers : managed, cuid {
      name                    : String @mandatory;
      originPlanet            : String; @mandatory
      spacesuitColor          : String;
      stardustCollection      : Decimal(15, 4) default 0;
      wormholeNavigationSkill : Integer default 0;
      department_ID           : Integer @mandatory;
      department              : Association to Departments on department.ID = department_ID;
      position_ID             : Integer @mandatory;
      position                : Association to Positions on position.ID = position_ID;
      email                   : String @mandatory;
}