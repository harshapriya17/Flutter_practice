import '../../presentation/projects/projects_controller.dart';
import '../../data/models/task_model.dart';
import '../../presentation/teams/teams_controller.dart';

class MockData {
  static List<Project> get projects => [
    Project(
      id: '1',
      title: 'ProjectHub AI',
      description: 'Student collaboration ecosystem platform',
      progress: 0.65,
      tags: ['Flutter', 'Dart', 'GetX'],
    ),
    Project(
      id: '2',
      title: 'EcoTracker',
      description: 'Monitor your carbon footprint in real-time',
      progress: 0.30,
      tags: ['Python', 'Django', 'React Native'],
    ),
  ];

  static List<TaskModel> get tasks => [
    TaskModel(
      id: '1',
      title: 'Setup Navigation',
      description: 'Implement GetX routing',
      status: 'completed',
      projectId: '1',
    ),
    TaskModel(
      id: '2',
      title: 'Build Dashboard',
      description: 'Create the main overview screen',
      status: 'in_progress',
      projectId: '1',
    ),
  ];

  static List<Team> get teams => [
    Team(id: '1', name: 'Alpha Squad', membersCount: 5, role: 'Lead'),
    Team(id: '2', name: 'Design Gurus', membersCount: 3, role: 'Member'),
  ];
}
