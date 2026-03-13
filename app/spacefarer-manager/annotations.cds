using SpacefarerService as service from '../../srv/spacefarer-service';
annotate service.Spacefarers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Origin Planet',
                Value : originPlanet,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Spacesuit Color',
                Value : spacesuitColor,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Stardust Collection',
                Value : stardustCollection,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Wormhole Navigation Skill',
                Value : wormholeNavigationSkill,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Department',
                Value : department_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Position',
                Value : position_ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'E-mail',
                Value : email,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Spacesuit Color',
            Value : spacesuitColor,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Stardust Collection',
            Value : stardustCollection,
        },
    ],
    UI.HeaderInfo : {
        @UI.Hidden : true,
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Spacefarer',
        TypeNamePlural : 'Spacefarers',
    }
);

annotate service.Spacefarers with @(
    Common.SideEffects #DepartmentChanged : {
        SourceProperties : [department_ID],
        TargetProperties  : ['position_ID'],
    }
);

annotate service.Spacefarers with {
    department_ID @(
        Common.Text : department.name,
        Common.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            Label : 'Department',
            CollectionPath : 'Departments',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : department_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'description',
                },
            ],
        }
    )
};

annotate service.Spacefarers with {
    position_ID @(
        Common.Text : position.title,
        Common.TextArrangement : #TextOnly,
        Common.ValueListWithFixedValues : true,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            Label : 'Position',
            CollectionPath : 'Positions',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterIn',
                    LocalDataProperty : department_ID,
                    ValueListProperty : 'department_ID',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    LocalDataProperty : position_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'title',
                },
            ],
        }
    )
};