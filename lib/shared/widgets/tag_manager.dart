import 'package:flutter/material.dart';
import '../../core/api/anime_panel_api.dart';
import '../../core/models/tag.dart';
import '../../theme/my_colors.dart';

class TagManager extends StatefulWidget {
  final List<String> selectedTagSlugs;
  final Function(List<String>) onUpdate;

  const TagManager({
    super.key,
    required this.selectedTagSlugs,
    required this.onUpdate,
  });

  @override
  State<TagManager> createState() => _TagManagerState();
}

class _TagManagerState extends State<TagManager> {
  List<Tag> _allTags = [];
  late Set<String> _selectedTagSlugs;
  bool _loading = false;
  String? _error;
  String _searchQuery = '';
  bool _showNewTagForm = false;
  String _newTagName = '';
  String _newTagCategory = 'emotion';

  final _categories = const [
    {'value': 'emotion', 'label': 'Emotion', 'emoji': '😊'},
    {'value': 'reaction', 'label': 'Reaction', 'emoji': '💬'},
    {'value': 'theme', 'label': 'Theme', 'emoji': '🎭'},
    {'value': 'character', 'label': 'Character', 'emoji': '👤'},
    {'value': 'other', 'label': 'Other', 'emoji': '🏷️'},
  ];

  @override
  void initState() {
    super.initState();
    _selectedTagSlugs = Set.from(widget.selectedTagSlugs);
    _loadTags();
  }

  Future<void> _loadTags() async {
    try {
      final tags = await AnimePanelApi.instance.getTags();
      setState(() => _allTags = tags);
    } catch (e) {
      setState(() => _error = 'Failed to load tags: $e');
    }
  }

  List<Tag> get _filteredTags {
    if (_searchQuery.trim().isEmpty) return _allTags;
    final query = _searchQuery.toLowerCase();
    return _allTags
        .where((tag) =>
            tag.name.toLowerCase().contains(query) ||
            tag.category.toLowerCase().contains(query))
        .toList();
  }

  Tag? get _exactMatch => _allTags
          .firstWhere(
            (tag) =>
                tag.name.toLowerCase() == _searchQuery.trim().toLowerCase(),
            orElse: () => const Tag(id: '', name: '', slug: '', category: ''),
          )
          .id
          .isEmpty
      ? null
      : _allTags.firstWhere(
          (tag) => tag.name.toLowerCase() == _searchQuery.trim().toLowerCase(),
        );

  bool get _showCreateOption =>
      _searchQuery.trim().isNotEmpty && _exactMatch == null;

  Map<String, List<Tag>> get _tagsByCategory {
    final map = <String, List<Tag>>{};
    for (final tag in _filteredTags) {
      map.putIfAbsent(tag.category, () => []).add(tag);
    }
    return map;
  }

  void _toggleTag(String slug) {
    setState(() {
      if (_selectedTagSlugs.contains(slug)) {
        _selectedTagSlugs.remove(slug);
      } else {
        _selectedTagSlugs.add(slug);
      }
      _handleUpdate();
    });
  }

  Future<void> _createTag([String? tagName]) async {
    final nameToUse = tagName ?? _newTagName.trim();

    if (nameToUse.isEmpty) {
      setState(() => _error = 'Tag name is required');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final tag = await AnimePanelApi.instance.createTag(
        name: nameToUse,
        category: _newTagCategory,
      );

      setState(() {
        _allTags.add(tag);
        _selectedTagSlugs.add(tag.slug);
        _newTagName = '';
        _searchQuery = '';
        _newTagCategory = 'emotion';
        _showNewTagForm = false;
      });
      _handleUpdate();
    } catch (e) {
      setState(() => _error = 'Failed to create tag: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  void _handleUpdate() {
    widget.onUpdate(_selectedTagSlugs.toList());
  }

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search Bar
        _buildSearchBar(colors),
        const SizedBox(height: 12),

        // Content - only show when searching
        if (_searchQuery.trim().isNotEmpty) ...[
          // Create new tag option
          if (_showCreateOption && !_showNewTagForm) _buildCreateOption(colors),

          // Empty state
          if (!_showCreateOption && _tagsByCategory.isEmpty) _buildEmptyState(),

          // Existing tags
          if (_tagsByCategory.isNotEmpty) _buildTagsList(colors),

          // New tag form
          if (_showNewTagForm) _buildNewTagForm(colors),
        ],

        // Error display
        if (_error != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              border: Border.all(color: Colors.red.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _error!,
              style: const TextStyle(color: Colors.red, fontSize: 14),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSearchBar(MyColors colors) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search tags or type to create new...',
        hintStyle: TextStyle(color: colors.onSurfaceVariant),
        prefixIcon: Icon(Icons.search, color: colors.onSurfaceVariant),
        filled: true,
        fillColor: colors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.surfaceContainerHigh),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colors.surfaceContainerHigh),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: MyColors.accentOrange.withOpacity(0.6)),
        ),
      ),
      onChanged: (value) => setState(() => _searchQuery = value),
    );
  }

  Widget _buildCreateOption(MyColors colors) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.accentOrange.withOpacity(0.1),
        border: Border.all(color: MyColors.accentOrange.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Create new tag: ',
                    style: TextStyle(color: colors.onSurface, fontSize: 14),
                    children: [
                      TextSpan(
                        text: '"$_searchQuery"',
                        style: TextStyle(color: MyColors.accentOrange),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'This tag doesn\'t exist yet',
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _loading
                ? null
                : () {
                    setState(() {
                      _newTagName = _searchQuery;
                      _showNewTagForm = true;
                    });
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.accentOrange,
              foregroundColor: Colors.black,
            ),
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Text(
          'No tags found matching "$_searchQuery"',
          style: const TextStyle(color: Color(0xFF888898)),
        ),
      ),
    );
  }

  Widget _buildTagsList(MyColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _tagsByCategory.entries.map((entry) {
        final category = entry.key;
        final tags = entry.value;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                category.toUpperCase().replaceAll('_', ' '),
                style: TextStyle(
                  color: colors.onSurfaceVariant,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: tags.map((tag) {
                  final isSelected = _selectedTagSlugs.contains(tag.slug);
                  return GestureDetector(
                    onTap: _loading ? null : () => _toggleTag(tag.slug),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? MyColors.accentOrange.withOpacity(0.2)
                            : colors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? MyColors.accentOrange
                              : const Color(0xFF2a2a2a),
                        ),
                      ),
                      child: Text(
                        tag.name,
                        style: TextStyle(
                          color: isSelected
                              ? MyColors.accentOrange
                              : colors.onSurface,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNewTagForm(MyColors colors) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0a0a0a),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2a2a2a)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create New Tag',
                style: TextStyle(
                  color: colors.onSurface,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: _loading
                    ? null
                    : () {
                        setState(() {
                          _showNewTagForm = false;
                          _newTagName = '';
                          _error = null;
                        });
                      },
                child: Text(
                  'Cancel',
                  style:
                      TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Tag name
          Text(
            'Tag Name',
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: TextEditingController(text: _newTagName),
            onChanged: (value) => setState(() => _newTagName = value),
            decoration: InputDecoration(
              hintText: 'e.g., Excited',
              filled: true,
              fillColor: colors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Category
          Text(
            'Category',
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _categories.map((cat) {
              final isSelected = _newTagCategory == cat['value'];
              return GestureDetector(
                onTap: _loading
                    ? null
                    : () => setState(() => _newTagCategory = cat['value']!),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? MyColors.accentOrange.withOpacity(0.1)
                        : colors.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected
                          ? MyColors.accentOrange
                          : const Color(0xFF2a2a2a),
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(cat['emoji']!, style: const TextStyle(fontSize: 16)),
                      const SizedBox(width: 6),
                      Text(
                        cat['label']!,
                        style: TextStyle(
                          color: isSelected
                              ? MyColors.accentOrange
                              : colors.onSurface,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Create button
          ElevatedButton(
            onPressed: _loading || _newTagName.trim().isEmpty
                ? null
                : () => _createTag(),
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.accentOrange,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: Text(_loading ? 'Creating...' : 'Create Tag'),
          ),
        ],
      ),
    );
  }
}
