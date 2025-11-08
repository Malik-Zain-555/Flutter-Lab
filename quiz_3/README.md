# 🧠 Quiz 3 — Flashcard Learning App

> **Focus:** Interactive flashcard system with animations, progress tracking, and smooth scrolling UI.

---

## 🎯 Objective

Build a **mini Flutter quiz app** that helps users study with digital flashcards.  
Each card shows a question, can be swiped to mark as “learned,” tapped to reveal its answer, and refreshed for a new quiz set.

---

## 🧩 Core Features

| Feature | Description |
|----------|-------------|
| **Scrollable Flashcards** | View all flashcards in a smooth scrollable list. |
| **Swipe to Mark Learned** | Use `Dismissible` to remove cards with animation. |
| **Tap to Reveal Answer** | Toggle between question and answer using `AnimatedCrossFade`. |
| **Pull-to-Refresh** | `RefreshIndicator` generates a new random quiz set. |
| **Dynamic Additions** | Add new flashcards via dialog and `AnimatedList.insertItem()`. |
| **Collapsing Header** | `SliverAppBar` shows quiz title and learning progress. |
| **Progress Tracker** | Displays “X of Y learned” with a live progress bar. |
| **Animated Updates** | Smooth insertion/removal transitions with `AnimatedList` and `Dismissible`. |

---

## 🧠 UI Preview

| Swip to Learn | Add new | Tap to Reveal |
|:----------------:|:--------------:|:---------------:|
| <img width="260" src="https://github.com/user-attachments/assets/d6363bf5-5356-4715-a11e-735182d6894a" /> | <img width="260" src="https://github.com/user-attachments/assets/c71110b4-c253-45b2-8fba-d0c78edd5d35" /> | <img width="260" src="https://github.com/user-attachments/assets/33de7223-a9e3-4ff4-96a6-8b82843f20d3" /> |

---

## ⚙️ Technical Overview

| Concept | Flutter Widget |
|----------|----------------|
| Scrollable Layout | `CustomScrollView` + `SliverAppBar` |
| Animated List | `AnimatedList` |
| Dismiss on Swipe | `Dismissible` |
| Refresh | `RefreshIndicator` |
| Card Animation | `AnimatedContainer` & `AnimatedCrossFade` |
| State | Local `setState()` management |
| Dialog Input | `AlertDialog` with validation |

---

## 🚀 Key Learnings

- How to combine **scrolling + slivers + animations** smoothly.  
- Using **`AnimatedList`** to maintain synced UI state for inserts/removals.  
- Implementing **interactive gestures** (`onTap`, `onDismissed`, `onRefresh`).  
- Managing **progress tracking** visually with a linear progress bar.  
- Applying **clean, modern UI design** with gradients and rounded cards.

---

## 🧱 Folder Structure

```
lib/
 └── main.dart      # Complete flashcard app logic and UI
```

---

## 🪄 How It Works

1. **Startup:** A random quiz set loads into the `AnimatedList`.  
2. **Swipe:** Card dismisses → marks question as learned → progress updates.  
3. **Tap:** Reveals or hides the answer using `AnimatedCrossFade`.  
4. **Pull-to-Refresh:** Clears list and loads a new randomized set.  
5. **Add Button:** Opens dialog → adds new question dynamically with animation.  

---

## 📊 Output Example

```
Flash Quiz
Progress: 2 of 6 learned
Actions: Swipe → learned | Tap → reveal | Pull → refresh
```
---

## 🧩 Concepts Covered

- Flutter Animations (`AnimatedList`, `AnimatedContainer`, `CrossFade`)
- Stateful Widgets and local state management  
- Gesture detection and dismiss events  
- UI polish: shadows, gradients, rounded cards  
- Data refresh and progress calculation  

---

## 👨‍💻 Developer Note

This quiz demonstrates practical **UI state management** and **animation control** in Flutter.  
It merges functionality with design — useful for flashcard-based learning, vocabulary practice, or quick-review quizzes.

---

**Developed for:** *Flutter Mobile Development — Quiz 3*  
**Student:** Zain Ali  
**Instructor:** *Waqar*  
**Institution:** *Riphah International University / Computer Science*  

---
