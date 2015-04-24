module Types
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
    ['UI/UX Design', 'uiuxdesign'],
    ['Unity', 'unity'],
    ['Web Design', 'webdesign'],
    ['Android', 'android'],
    ['Flash', 'flash'],
  ]

  Post = [
    ['Junior', 'junior'],
    ['Middle', 'middle'],
    ['Senior', 'senior'],
    ['Project Manager', 'pm'],
    ['Scrum Master', 'scrum'],
    ['Lead Software Engineer', 'leadsofteng'],
  ]
end

ActiveRecord::Base.extend Types