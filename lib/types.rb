module Types
  Roles = [
    ['Administrator', 'adm'],
    ['Manager', 'man'],
  ]

  Gender = [
    ['Male', 'm'],
    ['Female', 'f'],
  ]

  AreaOfExpertise = [
    ['RoR', 'rails'],
    [".Net", 'dotnet'],
    ["C#", 'csharp'],
    ["C++", 'cpp'],
    ['Java', 'java'],
    ['PHP', 'php'],
    ['QA', 'qa'],
    ['IOS', 'ios'],
    ['HTML', 'html'],
    ['Web designer', 'wdesigner'],
  ]
end

ActiveRecord::Base.extend Types