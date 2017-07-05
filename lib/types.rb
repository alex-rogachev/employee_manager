module Types
  ValidEmailRegex = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  Gender = [
    ['Male', 'm'],
    ['Female', 'f']
  ]

  AreaOfExpertise = [
    ['Angular', 'angular'],
    ['React', 'react'],
    ['React Native', 'reactnative'],
    ['RoR', 'rails'],
    [".Net", 'dotnet'],
    ["C#", 'csharp'],
    ["C++", 'cpp'],
    ['Java', 'java'],
    ['PHP', 'php'],
    ['Python', 'python'],
    ['QA', 'qa'],
    ['IOS', 'ios'],
    ['HTML', 'html'],
    ['JavaScript', 'javascript'],
    ['UI/UX Design', 'uiuxdesign'],
    ['Unity', 'unity'],
    ['Web Design', 'webdesign'],
    ['Android', 'android'],
    ['Flash', 'flash'],
    ['Delphi', 'delphi'],
    ['Wordpress', 'wp']
  ]

  Post = [
    ['Junior', 'junior'],
    ['Middle', 'middle'],
    ['Senior', 'senior'],
    ['Project Manager', 'pm'],
    ['Scrum Master', 'scrum'],
    ['Lead Software Engineer', 'leadsofteng']
  ]

  AllDocuments = [
    "application/pdf",
    "application/vnd.ms-excel",
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
    "application/msword",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
    "application/vnd.oasis.opendocument.text",
    "application/vnd.oasis.opendocument.formula",
    "text/plain"
  ]

  GoogleViewerDocuments = [
    "application/pdf",
    "application/msword",
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
  ]

  Email = [
    ['Invitation', 'invitation_message']
  ]

  Levels = [
    ['EL 1', 'el1'],
    ['EL 2', 'el2'],
    ['EL 3', 'el3'],
    ['EL 4', 'el4'],
  ]
end

ActiveRecord::Base.extend Types