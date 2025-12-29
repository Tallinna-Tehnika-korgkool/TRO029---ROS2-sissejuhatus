# .idx/dev.nix
{ pkgs, ... }:

{
  channel = "stable-24.05";

  packages = [
    pkgs.git
    pkgs.docker-compose
  ];

  services.docker.enable = true;

  idx = {
    workspace = {
      onCreate = {
        default.openFiles = [ "README.md" ];
      };
      
      onStart = {
        ros2-setup = ''
          set -e
          LOG="$HOME/.cache/idx-ros2.log"
          mkdir -p "$(dirname "$LOG")"
          exec > >(tee -a "$LOG") 2>&1

          echo "=== $(date -Iseconds) idx onStart: ros2 ==="

          # Wait for Docker daemon with longer timeout
          echo "[idx] Waiting for Docker daemon to start..."
          echo "[idx] This may take 1-2 minutes on first startup..."
          
          counter=0
          max_wait=90
          while [ "$counter" -lt "$max_wait" ]; do
            if docker info >/dev/null 2>&1; then
              echo "[idx] ✓ Docker is ready!"
              break
            fi
            
            # Show progress every 5 seconds
            remainder=$((counter % 5))
            if [ "$remainder" -eq 0 ] && [ "$counter" -gt 0 ]; then
              echo "[idx] Still waiting for Docker... ($counter seconds elapsed)"
            fi
            
            sleep 1
            counter=$((counter + 1))
          done

          if ! docker info >/dev/null 2>&1; then
            echo "[idx] ✗ ERROR: Docker failed to start after $max_wait seconds"
            echo "[idx] Try rebuilding your workspace or contact support"
            exit 1
          fi

          # Setup temp directory
          export TMPDIR="$HOME/.cache/tmp"
          mkdir -p "$TMPDIR"
          echo "[idx] TMPDIR=$TMPDIR"

          # Always rebuild to ensure students have latest version
          echo "[idx] Building Docker image (this ensures you have the latest version)..."
          docker build -t tro029-ros2:latest -f docker/Dockerfile .
          echo "[idx] Build complete"

          # Create and start container
          if ! docker ps -a --format '{{.Names}}' | grep -q "^tro029-ros2$"; then
            echo "[idx] Creating container..."
            docker run -d --name tro029-ros2 \
              -v "$PWD:/workspace" \
              -w /workspace \
              tro029-ros2:latest \
              sleep infinity
          else
            echo "[idx] Container exists, starting..."
            docker start tro029-ros2 2>/dev/null || true
          fi

          # Show status
          docker ps -a --filter name=tro029-ros2
          echo "[idx] Setup complete at $(date -Iseconds)"
        '';
        
        ros2-terminal = ''
          # Wait for container to be ready
          echo "Ootame ROS2 konteineri valmimist..."
          counter=0
          while [ "$counter" -lt 30 ]; do
            if docker ps --format '{{.Names}}' | grep -q "^tro029-ros2$"; then
              echo ""
              echo "╔════════════════════════════════════════════════════════════╗"
              echo "║                                                            ║"
              echo "║   TRO029 - ROS2 Sissejuhatus                               ║"
              echo "║   Tallinna Tehnikakõrgkool                                 ║"
              echo "║                                                            ║"
              echo "╚════════════════════════════════════════════════════════════╝"
              echo ""
              echo "✓ ROS2 keskkond on valmis!"
              echo ""
              echo "📚 Õppematerjalid: Vaata README.md faili"
              echo "🐳 Sa oled nüüd ROS2 Docker konteineri sees"
              echo ""
              echo "🚀 Alusta nende käskudega:"
              echo "   → ros2 --help           # ROS2 abi ja käsud"
              echo "   → ros2 topic list       # Vaata aktiivseid teemasid"
              echo "   → ros2 node list        # Vaata aktiivseid node'e"
              echo "   → colcon build          # Ehita ROS2 workspace"
              echo ""
              echo "💡 Näpunäiteid:"
              echo "   • Kõik muudatused /workspace kaustas salvestatakse"
              echo "   • Töötad oma Google kontoga Google IDX keskkonnas"
              echo "   • Saad õppida omas tempos, kus ja millal soovid"
              echo ""
              echo "📖 Kursuse struktuur ja ülesanded on README.md failis"
              echo "❓ Küsimused? Vaata dokumentatsiooni või küsi juhendajalt"
              echo ""
              echo "────────────────────────────────────────────────────────────"
              echo ""
              exec docker exec -it tro029-ros2 bash
            fi
            sleep 1
            counter=$((counter + 1))
          done
          echo "⚠ Konteiner ei ole veel valmis. Proovi käsitsi: docker exec -it tro029-ros2 bash"
        '';
      };
    };
    
    previews = {
      enable = true;
    };
  };
}